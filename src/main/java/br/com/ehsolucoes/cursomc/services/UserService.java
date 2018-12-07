package br.com.ehsolucoes.cursomc.services;

import br.com.ehsolucoes.cursomc.security.UserSS;
import org.springframework.security.core.context.SecurityContextHolder;

public class UserService {
    public static UserSS authentiated(){
        try {
            return (UserSS) SecurityContextHolder
                    .getContext()
                    .getAuthentication()
                    .getPrincipal();
        }catch (Exception ex){
            return null;
        }
    }
}
