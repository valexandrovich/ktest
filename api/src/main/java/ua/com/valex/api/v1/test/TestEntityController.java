package ua.com.valex.api.v1.test;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/api/v1/test")
public class TestEntityController {

    @GetMapping
    public TestEntityDto getTestEntity() {
        return new TestEntityDto(1L, "Hello World!");
    }


}
