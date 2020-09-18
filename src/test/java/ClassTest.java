package com.cicd.cicdappliedtospringbootjavaapp;

import org.junit.Assert;
import org.junit.Test;
import org.junit.runner.RunWith;
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
