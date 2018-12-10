package br.com.ehsolucoes.cursomc;

import br.com.ehsolucoes.cursomc.domain.*;
import br.com.ehsolucoes.cursomc.domain.enums.EstadoPagamento;
import br.com.ehsolucoes.cursomc.domain.enums.TipoCliente;
import br.com.ehsolucoes.cursomc.repositories.*;
import br.com.ehsolucoes.cursomc.services.S3Service;
import org.hibernate.annotations.NaturalId;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.CommandLineRunner;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

import java.lang.reflect.Array;
import java.text.SimpleDateFormat;
import java.util.Arrays;

@SpringBootApplication
public class CursomcApplication implements CommandLineRunner {

    @Autowired
    private S3Service s3Service;

    public static void main(String[] args) {
        SpringApplication.run(CursomcApplication.class, args);
    }

    @Override
    public void run(String... args) throws Exception {
        s3Service.uploadFile("G:\\Desenvolvimento\\Java\\cursomc\\teste.jpg");
    }
}

