package br.com.ehsolucoes.cursomc.services.validation;

import br.com.ehsolucoes.cursomc.domain.Cliente;
import br.com.ehsolucoes.cursomc.domain.enums.TipoCliente;
import br.com.ehsolucoes.cursomc.dto.ClienteNewDTO;
import br.com.ehsolucoes.cursomc.repositories.ClienteRepository;
import br.com.ehsolucoes.cursomc.resources.exception.FieldMessage;
import br.com.ehsolucoes.cursomc.services.validation.utils.BR;
import org.springframework.beans.factory.annotation.Autowired;

import javax.validation.ConstraintValidator;
import javax.validation.ConstraintValidatorContext;
import java.util.ArrayList;
import java.util.List;

public class ClienteInsertValidator implements ConstraintValidator<ClienteInsert, ClienteNewDTO> {

    @Autowired
    private ClienteRepository clienteRepository;

    @Override
    public void initialize(ClienteInsert ann){}
    @Override
    public boolean isValid(ClienteNewDTO objDto, ConstraintValidatorContext context){

        List<FieldMessage> list = new ArrayList<>();

        //testando se o cpf é válido dependendo do tipo da pessoa
        if(objDto.getTipo().equals(TipoCliente.PESSOAFISICA.getCod()) && !BR.isValidCPF(objDto.getCpfOuCnpj()))
            list.add(new FieldMessage("cpfOuCnpj", "CPF Inválido"));

        if(objDto.getTipo().equals(TipoCliente.PESSOAJURIDICA.getCod()) && !BR.isValidCNPJ(objDto.getCpfOuCnpj()))
            list.add(new FieldMessage("cpfOuCnpj", "CNPJ Inválido"));

        Cliente aux = clienteRepository.findByEmail(objDto.getEmail());
        if(aux != null)
            list.add(new FieldMessage("email", "E-mail já existente"));

        for(FieldMessage e : list){
            context.disableDefaultConstraintViolation();
            context.buildConstraintViolationWithTemplate(e.getMessage())
                    .addPropertyNode(e.getFieldName())
                        .addConstraintViolation();
        }
        return list.isEmpty();
    }
}
