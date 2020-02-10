package com.quik.service;

import java.util.List;

import com.quik.entity.Recipe;

public interface RecipeService {

	public List<Recipe> getRecipes();

	public void saveRecipe(Recipe theRecipe);

	public Recipe getRecipe(int theId);

	public void deleteRecipe(int theId);
	
	public List<Recipe> searchRecipes(String theSearchName);
	
}
