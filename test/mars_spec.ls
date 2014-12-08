require! '../lib/mars'

describe 'Mars' !->

  describe 'when initialised' !->
    beforeEach !->
      mars = new Mars 5,3

    specify 'has a maximum x coordinate' !->
      (expect mars.maxXCoordinate).to.equal 5

    specify 'has a maximum y coordinate' !->
      (expect mars.maxYCoordinate).to.equal 3
