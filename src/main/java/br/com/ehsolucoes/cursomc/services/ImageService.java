package br.com.ehsolucoes.cursomc.services;

import br.com.ehsolucoes.cursomc.services.exceptions.FileException;
import org.apache.commons.io.FilenameUtils;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import javax.imageio.ImageIO;
import java.awt.*;
import java.awt.image.BufferedImage;
import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;

@Service
public class ImageService {

    public BufferedImage getJpgImageFromFile(MultipartFile multipartFile){
        String ext = FilenameUtils.getExtension(multipartFile.getOriginalFilename());
        if(!"png".equals(ext.toLowerCase().trim()) && !"jpg".equals(ext.toLowerCase().trim())){
            throw new FileException("Somente imagens PNG e JPG são permitidas");
        }
        try {
            BufferedImage img = ImageIO.read(multipartFile.getInputStream());
            if("png".equals(ext.toLowerCase().trim())){
                img = pngToJpg(img);
            }
            return img;
        } catch (IOException e) {
            throw new FileException("Erro ao ler arquivo: " + e.getMessage());
        }
    }

    public BufferedImage pngToJpg(BufferedImage img) {
        BufferedImage jpgImage = new BufferedImage(img.getWidth(),
                                                   img.getHeight(),
                                                   BufferedImage.TYPE_INT_RGB);
        jpgImage.createGraphics().drawImage(img, 0, 0, Color.WHITE, null); //color white é para preencher o fundo de png com fundo transparente
        return jpgImage;
    }

    public InputStream getInputStream(BufferedImage bufferedImage, String extension){
        try {
            ByteArrayOutputStream byteArrayOutputStream = new ByteArrayOutputStream();
            ImageIO.write(bufferedImage, extension, byteArrayOutputStream);
            return new ByteArrayInputStream(byteArrayOutputStream.toByteArray());
        }catch (IOException ex){
            throw new FileException("Erro ao ler arquivo.");
        }
    }

}
