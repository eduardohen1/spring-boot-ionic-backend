package br.com.ehsolucoes.cursomc.services;

import br.com.ehsolucoes.cursomc.domain.Categoria;
import br.com.ehsolucoes.cursomc.repositories.CategoriaRepository;
import br.com.ehsolucoes.cursomc.services.exceptions.ObjectNotFoundException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Optional;

@Service
public class CategoriaService {

    @Autowired
    private CategoriaRepository repo;

    public Categoria buscar(Integer id){
        Optional<Categoria> obj = repo.findById(id);
        return obj.orElseThrow(
                () -> new ObjectNotFoundException(
                        "Objeto não encontrado! Id: " + id + ", Tipo: " + Categoria.class.getName()
                )
        );
    }

}
