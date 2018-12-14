package br.com.ehsolucoes.cursomc.services;

import br.com.ehsolucoes.cursomc.domain.Estado;
import br.com.ehsolucoes.cursomc.repositories.EstadoRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class EstadoService {

    @Autowired
    private EstadoRepository estadoRepository;

    public List<Estado> findAll(){
        return estadoRepository.findAllByOrderByNome();
    }

}
