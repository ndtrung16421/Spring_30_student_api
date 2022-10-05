package com.example.Student_client;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller

public class HomeController {

    

    @GetMapping("/view")
    public String viewBooks( ) {
       
        return "view";
    }
}