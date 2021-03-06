//
//  RecipeIngredientsInterfaceController.swift
//  SousChef
//
//  Created by Ehsan Valizadeh on 3/4/15.
//  Copyright (c) 2015 Ray Wenderlich. All rights reserved.
//

import WatchKit
import Foundation
import SousChefKit

class RecipeIngredientsInterfaceController: WKInterfaceController {
  var recipe: Recipe?
  let groceryList = GroceryList()

    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
      recipe = context as? Recipe
      
      if let ingredients = recipe?.ingredients {
        table.setNumberOfRows(ingredients.count, withRowType: "IngredientRow")
        
        for (index, ingredient) in enumerate(ingredients) {
          let controller = table.rowControllerAtIndex(index) as IngredientRowController
          controller.nameLabel.setText(ingredient.name.capitalizedString)
          controller.measurementLabel.setText(ingredient.quantity)
        }
      }
      
    }
  
  @IBAction func onAddToGrocery() {
    
    if let items = self.recipe?.ingredients {
      for item in items {
        groceryList.addItemToList(item)
      }
      groceryList.sync() 
    }
  }
  
  

    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
    }

    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }

  @IBOutlet weak var table: WKInterfaceTable!
}
