package com.quik.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.quik.entity.Recipe;
import com.quik.service.RecipeService;

@Controller
@RequestMapping("/recipe")
public class RecipeController {

	@Autowired
	private RecipeService recipeService;
	
	@GetMapping("/list")
	public String listRecipes(Model theModel) {
		
		List<Recipe> theRecipes = recipeService.getRecipes();
				
		theModel.addAttribute("recipes", theRecipes);
		
		return "list-recipes";
	}
	
	@GetMapping("/showFormForAdd")
	public String showFormForAdd(Model theModel) {
		
		Recipe theRecipe = new Recipe();
		
		theModel.addAttribute("recipe", theRecipe);
		
		return "recipe-form";
	}
	
	@PostMapping("/saveRecipe")
	public String saveRecipe(@ModelAttribute("recipe") Recipe theRecipe) {
		
		recipeService.saveRecipe(theRecipe);	
		
		return "redirect:/recipe/list";
	}
	
	@GetMapping("/showFormForUpdate")
	public String showFormForUpdate(@RequestParam("recipeId") int theId, Model theModel) {
		
		Recipe theRecipe = recipeService.getRecipe(theId);

		theModel.addAttribute("recipe", theRecipe);
			
		return "recipe-form";
	}
	
	@GetMapping("/delete")
	public String deleteRecipe(@RequestParam("recipeId") int theId) {
		
		// delete the customer
		recipeService.deleteRecipe(theId);
		
		return "redirect:/recipe/list";
	}
	
	@GetMapping("/search")
	public String searchRecipe(@RequestParam("theSearchName") String theSearchName, Model theModel) {
		
		List<Recipe> theRecipes = recipeService.searchRecipes(theSearchName);
		
		theModel.addAttribute("recipes", theRecipes);
		
		return "list-recipes";
	}
	
	@GetMapping("/showcase")
	public String showCaseRecipe(@RequestParam("recipeId") int theId, Model theModel) {
		
		Recipe theRecipe = recipeService.getRecipe(theId);
		
		theModel.addAttribute("recipe", theRecipe);
				
		return "showcase-recipe";
	}
}
