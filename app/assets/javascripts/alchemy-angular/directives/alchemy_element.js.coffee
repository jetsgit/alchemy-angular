App.directive 'alchemyElement', ['$sce', ($sce) ->
  {
    restrict: 'E'
    $scope: {
      element: "="
    }
    replace: true
    link: (scope, element, attrs) ->

      # Every element has its very own template.
      # The elements are placed at your angular template path
      # with 'alchemy/elements' prefix
      scope.elementTemplate = "alchemy/elements/#{scope.element.name}.html"

      # The ingredients of current element
      scope.ingredients = scope.element.ingredients

      # Returns all ingredients with given haven
      scope.ingredients_with_name = (name) ->
        _.where(scope.ingredients, {name: name})

      # Returns the ingredient value of given name
      scope.ingredient = (name) ->
        ingredient = _.findWhere(scope.ingredients, {name: name})
        ingredient.value if ingredient

      # Checks if the ingredient with given name is not null or empty
      scope.ingredient_present = (name) ->
        scope.ingredient(name) && scope.ingredient(name) != ''

      return
    template: '<div ng-include="elementTemplate"></div>'
  }
]
