package com.example.service;

import org.springframework.stereotype.Component;
import org.springframework.stereotype.Service;

@Service
//Either put @Servcie or @Component annotation
public class HelloWorldImpl implements HelloWorld {

	@Override
	public String printHelloWorld(String msg) {

		System.out.println("Hello : " + msg);
		
		return "Hello" + msg;
	}

}
