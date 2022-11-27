package com.urfavoriteott.ufo.contents.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.urfavoriteott.ufo.contents.model.service.PaymentService;

@Controller
public class PaymentController {

    @Autowired
    private PaymentService paymentService;
}