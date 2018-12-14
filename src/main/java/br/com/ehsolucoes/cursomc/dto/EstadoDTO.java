package br.com.ehsolucoes.cursomc.dto;

import br.com.ehsolucoes.cursomc.domain.Estado;

import java.io.Serializable;

public class EstadoDTO  implements Serializable {

    private static final long serialVersionUID = 1L;

    private Integer id;
    private String nome;

    private EstadoDTO(){}

    public EstadoDTO(Estado estado) {
        this.id = estado.getId();
        this.nome = estado.getNome();
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }
}
