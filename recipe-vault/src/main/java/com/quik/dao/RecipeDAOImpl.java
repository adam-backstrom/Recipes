package com.quik.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.quik.entity.Recipe;

@Repository
public class RecipeDAOImpl implements RecipeDAO {

	@Autowired
	private SessionFactory sessionFactory;
			
	@Override
	public List<Recipe> getRecipes() {
		
		Session currentSession = sessionFactory.getCurrentSession();
				
		Query<Recipe> theQuery = currentSession.createQuery("from Recipe order by title", Recipe.class);
		
		List<Recipe> Recipes = theQuery.getResultList();
	
		return Recipes;
	}

	@Override
	public void saveRecipe(Recipe theRecipe) {

		Session currentSession = sessionFactory.getCurrentSession();

		currentSession.saveOrUpdate(theRecipe);
		
	}

	@Override
	public Recipe getRecipe(int theId) {

		Session currentSession = sessionFactory.getCurrentSession();

		Recipe theRecipe = currentSession.get(Recipe.class, theId);
		
		return theRecipe;
	}

	@Override
	public void deleteRecipe(int theId) {

		Session currentSession = sessionFactory.getCurrentSession();
		
		Query theQuery = currentSession.createQuery("delete from Recipe where id=:RecipeId");
		theQuery.setParameter("RecipeId", theId);
		
		theQuery.executeUpdate();		
	}
	
	@Override
	public List<Recipe> searchRecipes(String theSearchName) {
		
		Session currentSession = sessionFactory.getCurrentSession();
		
		Query theQuery = null;
		
		if (theSearchName != null && theSearchName.trim().length() > 0) {
			
			theQuery = currentSession.createQuery("from Recipe where lower(title) like :theName", Recipe.class);
			theQuery.setParameter("theName", "%" + theSearchName.toLowerCase() + "%");
		}
		
		else {
			theQuery = currentSession.createQuery("from Recipe", Recipe.class);
		}
		
		List<Recipe> Recipes = theQuery.getResultList();
		
		return Recipes;	
	}
}
