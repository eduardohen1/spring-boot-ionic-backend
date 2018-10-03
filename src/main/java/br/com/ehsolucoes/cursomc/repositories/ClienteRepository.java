package br.com.ehsolucoes.cursomc.repositories;

import br.com.ehsolucoes.cursomc.domain.Categoria;
import br.com.ehsolucoes.cursomc.domain.Cliente;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface ClienteRepository extends JpaRepository<Cliente, Integer> {

}
