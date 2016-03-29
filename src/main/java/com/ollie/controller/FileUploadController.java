package com.ollie.controller;


import com.ollie.dao.FileUploadDao;
import java.io.ByteArrayInputStream;
import java.io.IOException;
import java.util.List;
import javax.inject.Inject;
import javax.servlet.http.HttpServletResponse;
import com.ollie.model.FileUpload;
import org.apache.commons.io.IOUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;


@Controller
@RequestMapping(value = "/")
public class FileUploadController {

    private final FileUploadDao fileDao;

    @Inject
    public FileUploadController(FileUploadDao fileDao) {

        this.fileDao = fileDao;

    }

    @RequestMapping(value = " ", method = RequestMethod.GET)
    public String showPage(Model model) throws IOException {
        
        List<FileUpload> files = fileDao.list();
        
        model.addAttribute("files", files);


        return "index";

    }
    
    @RequestMapping(value = "/upload/showImage/{id}", method = RequestMethod.GET)
    public void showImage(@PathVariable("id") Integer id, HttpServletResponse response) throws IOException   {
        
        FileUpload file = fileDao.get(id);
        IOUtils.copy(new ByteArrayInputStream(file.getFileByte()), response.getOutputStream());
        response.setContentType(file.getExtensionType());
        
    }
 
    @RequestMapping(value = "/upload", method = RequestMethod.POST)
    @ResponseBody    
    public FileUpload handleFormUpload(@RequestParam("file") MultipartFile file) throws IOException {
            FileUpload fileUpload = new FileUpload();
            
            
            fileUpload.setFileByte(file.getBytes());
            fileUpload.setExtensionType(file.getContentType());
            fileUpload.setFileName(file.getOriginalFilename());
            fileUpload.setId(fileDao.add(fileUpload).getId());
            
            return fileUpload;
        }
    
    @RequestMapping(value = "upload/{id}", method = RequestMethod.DELETE)
    @ResponseBody
    public void deleteImage(@PathVariable("id") Integer id) {
        
        fileDao.delete(id);
    }

}
