/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.howtodoinjava.controller;

import com.howtodoinjava.entity.Materia;
import com.howtodoinjava.forms.Registro;
import com.howtodoinjava.service.MateriaManager;
import com.howtodoinjava.service.UsuarioManager;
import java.util.List;
import static org.hamcrest.CoreMatchers.equalTo;
import org.junit.After;
import org.junit.AfterClass;
import org.junit.Before;
import org.junit.BeforeClass;
import org.junit.Test;
import static org.junit.Assert.*;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.MockitoAnnotations;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.test.web.servlet.MockMvc;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.*;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.*;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;
import static org.springframework.test.web.servlet.setup.MockMvcBuilders.*;
import org.mockito.junit.MockitoJUnitRunner;
import org.springframework.web.servlet.View;
import org.springframework.test.context.junit4.*;
import org.junit.runner.RunWith;
import org.junit.Test;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.web.WebAppConfiguration;
import com.howtodoinjava.forms.Registro;


/**
 *
 * @author jt
 */
@RunWith(SpringJUnit4ClassRunner.class)
@WebAppConfiguration
@ContextConfiguration(locations = "classpath:applicationContext.xml")
public class RegistroControllerTest {
    
    public RegistroControllerTest() {
    }
    @InjectMocks
    RegistroController registroController;  

    @Mock
    private MateriaManager materiaManager;
    
    @Mock
    View mockView;
    
    MockMvc mockMvc;
    
    @BeforeClass
    public static void setUpClass() {
    }
    
    @AfterClass
    public static void tearDownClass() {
    }
    
    @Before
    public void setUp() {
        MockitoAnnotations.initMocks(this);
        mockMvc = MockMvcBuilders.standaloneSetup(registroController).setSingleView(mockView).build();
    }
    
    @After
    public void tearDown() {
    }

    /**
     * Test of createUsuarioProfile method, of class RegistroController.
     */
    @Test
    public void testCreateUsuarioProfile() throws Exception {
        List<Materia> list = materiaManager.getAllMaterias();
        ModelMap modelMap = new ModelMap();
        String viewName = registroController.createUsuarioProfile(modelMap);
        //Check if string value of return is equal to correct
        assertEquals("registro",viewName);
        //Try access to this route and check de ModelMaps attributes 
        mockMvc.perform(get("/registro").param("new","true"))
                .andExpect(status().isOk())
                .andExpect(model().attribute("valueSubmit", equalTo("Register")))
                .andExpect(model().attribute("isRegistro", equalTo("1")))
                .andExpect(model().attribute("materias", equalTo(list)))
                .andExpect(model().attribute("registro", equalTo(new Registro())));
    }
//
//    /**
//     * Test of addUsuarioFromForm method, of class RegistroController.
//     */
//    @Test
//    public void testAddUsuarioFromForm() {
//        System.out.println("addUsuarioFromForm");
//        Registro registro = null;
//        BindingResult bindingResult = null;
//        ModelMap map = null;
//        RegistroController instance = new RegistroController();
//        String expResult = "";
//        String result = instance.addUsuarioFromForm(registro, bindingResult, map);
//        assertEquals(expResult, result);
//        // TODO review the generated test code and remove the default call to fail.
//        fail("The test case is a prototype.");
//    }
//
//    /**
//     * Test of setUsuarioManager method, of class RegistroController.
//     */
//    @Test
//    public void testSetUsuarioManager() {
//        System.out.println("setUsuarioManager");
//        UsuarioManager usuarioManager = null;
//        RegistroController instance = new RegistroController();
//        instance.setUsuarioManager(usuarioManager);
//        // TODO review the generated test code and remove the default call to fail.
//        fail("The test case is a prototype.");
//    }
    
}
