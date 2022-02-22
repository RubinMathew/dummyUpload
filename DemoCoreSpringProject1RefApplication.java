import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.EnableAutoConfiguration;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.ApplicationContext;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.Import;

import com.example.configuration.AppConfig;
import com.example.service.HelloWorld;



@ComponentScan({"com.example"})
@Import({AppConfig.class})
@EnableAutoConfiguration
@SpringBootApplication
public class DemoCoreSpringProject1RefApplication {
	public static void main(String[] args) {
		//SpringApplication.run(DemoCoreSpringProjectApplication.class, args);
	ApplicationContext context=SpringApplication.run(AppConfig.class);
		
	    HelloWorld obj = (HelloWorld) context.getBean("helloBean");
	    
	    obj.printHelloWorld("Spring5 Java Config");
	}

}
