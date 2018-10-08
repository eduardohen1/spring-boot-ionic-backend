package br.com.ehsolucoes.cursomc.services;

import br.com.ehsolucoes.cursomc.domain.Cliente;
import br.com.ehsolucoes.cursomc.repositories.ClienteRepository;
import br.com.ehsolucoes.cursomc.services.exceptions.ObjectNotFoundException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Optional;

@Service
public class ClienteService {

    @Autowired
    private ClienteRepository repo;

    public Cliente buscar(Integer id){
        Optional<Cliente> obj = repo.findById(id);
        return obj.orElseThrow(
                () -> new ObjectNotFoundException(
                        "Objeto não encontrado! Id: " + id + ", Tipo: " + Cliente.class.getName()
                )
        );
    }

}
