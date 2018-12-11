package br.com.ehsolucoes.cursomc.services;

import br.com.ehsolucoes.cursomc.domain.Cidade;
import br.com.ehsolucoes.cursomc.domain.Cliente;
import br.com.ehsolucoes.cursomc.domain.Endereco;
import br.com.ehsolucoes.cursomc.domain.enums.Perfil;
import br.com.ehsolucoes.cursomc.domain.enums.TipoCliente;
import br.com.ehsolucoes.cursomc.dto.ClienteDTO;
import br.com.ehsolucoes.cursomc.dto.ClienteNewDTO;
import br.com.ehsolucoes.cursomc.repositories.CidadeRepository;
import br.com.ehsolucoes.cursomc.repositories.ClienteRepository;
import br.com.ehsolucoes.cursomc.repositories.EnderecoRepository;
import br.com.ehsolucoes.cursomc.security.UserSS;
import br.com.ehsolucoes.cursomc.services.exceptions.AuthorizationException;
import br.com.ehsolucoes.cursomc.services.exceptions.DataIntegrityException;
import br.com.ehsolucoes.cursomc.services.exceptions.ObjectNotFoundException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.dao.DataIntegrityViolationException;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Sort;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import javax.transaction.Transactional;
import java.awt.image.BufferedImage;
import java.net.URI;
import java.util.List;
import java.util.Optional;

@Service
public class ClienteService {

    @Autowired
    private ClienteRepository repo;
    @Autowired
    private CidadeService cidadeService;
    @Autowired
    private EnderecoRepository enderecoRepository;
    @Autowired
    private BCryptPasswordEncoder pe;
    @Autowired
    private S3Service s3Service;
    @Autowired
    private ImageService imageService;
    @Value("${img.prefix.client.profile}")
    private String prefix;

    public Cliente find(Integer id){

        UserSS user = UserService.authentiated();
        if(user==null || !user.hasRole(Perfil.ADMIN) && !id.equals(user.getId())){
            throw new AuthorizationException("Acesso negado");
        }

        Optional<Cliente> obj = repo.findById(id);
        return obj.orElseThrow(
                () -> new ObjectNotFoundException(
                        "Objeto não encontrado! Id: " + id + ", Tipo: " + Cliente.class.getName()
                )
        );
    }

    @Transactional
    public Cliente insert(Cliente obj){
        obj.setId(null);
        obj = repo.save(obj);
        enderecoRepository.saveAll(obj.getEnderecos());
        return obj;
    }

    public Cliente update(Cliente obj){
        Cliente newObj = find(obj.getId());
        updateData(newObj, obj);
        return repo.save(newObj);
    }

    private void updateData(Cliente newObj, Cliente obj) {
        newObj.setNome(obj.getNome());
        newObj.setEmail(obj.getEmail());
    }

    public void delete(Integer id){
        find(id);
        try {
            repo.deleteById(id);
        }catch (DataIntegrityViolationException e){
            throw new DataIntegrityException("Não é possível excluir porque há pedidos relacionados!");
        }
    }

    public List<Cliente> findAll(){
        return repo.findAll();
    }

    public Page<Cliente> findPage(Integer page, Integer linesPerPage, String orderBy, String direction){
        PageRequest pageRequest = PageRequest.of(page, linesPerPage, Sort.Direction.valueOf(direction), orderBy);
        return repo.findAll(pageRequest);
    }

    public Cliente fromDTO(ClienteDTO objDto){
        //return new Cliente(objDto.getId(), objDto.getNome());
        return new Cliente(objDto.getId(),objDto.getNome(),objDto.getEmail(), null, null, null);
    }

    public Cliente fromDTO(ClienteNewDTO objDto){
        Cliente cli = new Cliente(null, objDto.getNome(), objDto.getEmail(), objDto.getCpfOuCnpj(), TipoCliente.toEnum(objDto.getTipo()), pe.encode(objDto.getSenha()));
        Cidade cid = cidadeService.find(objDto.getCidadeId());
        Endereco end = new Endereco(null, objDto.getLogradouro(), objDto.getNumero(), objDto.getComplemento(), objDto.getBairro(), objDto.getCep(), cli, cid);
        cli.getEnderecos().add(end);
        cli.getTelefones().add(objDto.getTelefone1());
        if(objDto.getTelefone2() != null) cli.getTelefones().add(objDto.getTelefone2());
        if(objDto.getTelefone3() != null) cli.getTelefones().add(objDto.getTelefone3());
        return cli;
    }

    public URI uploadProfilePricture(MultipartFile multipartFile){
        UserSS user = UserService.authentiated();
        if(user == null){
            throw new AuthorizationException("Acesso negado");
        }
        BufferedImage jpgImage = imageService.getJpgImageFromFile(multipartFile);
        String fileName = prefix + user.getId() + ".jpg";
        return s3Service.uploadFile(imageService.getInputStream(jpgImage, "jpg"), fileName, "image");
    }

}
