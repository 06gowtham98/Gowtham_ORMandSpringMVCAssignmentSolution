package com.gl.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.gl.entities.Customer;
import com.gl.service.CustomerService;


@Controller
@RequestMapping("/customer")
public class CustomerController {
	// add the customer from the service
	@Autowired
	private CustomerService CustomerService;

	@RequestMapping("/list")
	public String listCustomer(Model model) {
		// get all the Customer from the service
		List<Customer> customer = CustomerService.findAll();
		System.out.print("list"+customer.toString());
		model.addAttribute("customers", customer);
		// send over to our form
		return "customer-list";
	}

	@RequestMapping("/showFormForAdd")
	public String showFormForAdd(Model theModel) {
		// get the customer from the service
		Customer customer = new Customer();
		// set customer as a model attribute to pre-populate the form
		theModel.addAttribute("customers", customer);
		System.out.print("list for add"+customer.toString());
		// send over to our form
		return "customer-form";
	}

	@RequestMapping("/showFormForUpdate")
	public String showFormForUpdate(@RequestParam("customerId") int theId, Model theModel) {
		// get the customer from the service
		Customer customer = CustomerService.findById(theId);
		// set customer as a model attribute to pre-populate the form
		theModel.addAttribute("customers", customer);
		System.out.println("Show for update"+customer);
		// send over to our form
		return "customer-form";
	}

	@PostMapping("/save")
	public String saveCustomer(@RequestParam("id") int id, @RequestParam("firstName") String firstName,
			@RequestParam("lastName") String lastName, @RequestParam("email") String email) {

		Customer customer;
		if (id != 0) {
			customer = CustomerService.findById(id);
			customer.setfirstName(firstName);
			customer.setlastName(lastName);
			customer.setEmail(email);
		} else
			customer = new Customer(firstName, lastName, email);
		// save the Book
		CustomerService.save(customer);

		// use a redirect to prevent duplicate submissions
		return "redirect:/customer/list";

	}

	@RequestMapping("/delete")
	public String delete(@RequestParam("customerId") int theId) {

		// delete the customer
		CustomerService.deleteById(theId);

		// redirect to /customer/list
		return "redirect:/customer/list";

	}

}
