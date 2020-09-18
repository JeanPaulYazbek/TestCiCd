package com.cicd.cicdappliedtospringbootjavaapp;

import org.junit.jupiter.Assert;
import org.junit.jupiter.Test;
import org.junit.jupiter.runner.RunWith;
import org.springframework.boot.test.context.SpringBootTest;

import org.springframework.test.context.junit4.SpringRunner;

@RunWith(SpringRunner.class)
@SpringBootTest

public class ClassTest {
	

	@Test
	public void funTest() {
		
		Assert.assertEquals("Hello","Hello");
	}
	
	

}
