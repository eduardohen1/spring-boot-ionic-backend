package br.com.ehsolucoes.cursomc.filters;

import org.springframework.stereotype.Component;

import javax.servlet.*;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@Component
public class HeaderExposureFilter implements Filter {


    @Override
    public void init(FilterConfig filterConfig) throws ServletException {

    }

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
        HttpServletResponse res = (HttpServletResponse) response;
        res.addHeader("access-control-expose-headers","location");
        chain.doFilter(request, response);
        // este filtro intercepta a requisição, faz uma avaliação, expoe no cabeçalho da resposta o termo 'location'
    }

    @Override
    public void destroy() {

    }
}
