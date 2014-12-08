require! '../lib/robot'

describe 'A robot' !->

  describe 'when initalised' !->
    beforeEach !->
      robot = new Robot 1, 2, 'E', ['F','R','F','R','F']

    specify 'has an x coordinate' !->
      (expect robot.xCoord).to.equal 1

    specify 'has a y coordinate ' !->
      (expect robot.yCoord).to.equal 2

    specify 'has an orientation' !->
      (expect robot.facing).to.equal 'E'

    specify 'has a set of instructions' !->
      (expect robot.instructions).to.equal ['F','R','F','R','F']

  describe 'has state' !->

    specify 'when lost is lost' !->
      (expect robot.lost?).to.be true

    specify 'when safe is not lost' !->
      (expect robot.lost?).to.be false

  describe 'converts orientation to quarternary orientation' !->

    specify 'north facing is 0' !->
      robot = new Robot 1, 2, 'N', []
      (expect robot.orientation).to.equal 0

    specify 'east facing is 1' !->
      robot = new Robot 1, 2, 'E', []
      (expect robot.orientation).to.equal 1

    specify 'south facing is 2' !->
      robot = new Robot 1, 2, 'S', []
      (expect robot.orientation).to.equal 2

    specify 'west facing is 3' !->
      robot = new Robot 1, 2, 'W', []
      (expect robot.orientation).to.equal 3

  describe 'following instructions' !->

    describe 'turning right' !->

      specify 'orientation increases by 1' !->
        robot = new Robot 1, 2, 'N', ['R']
        robot.move
        (expect robot.orientation).to.equal 1

      specify 'if orientation is 3 then will turn to 0' !->
        robot = new Robot 1, 2, 'W', ['R']
        robot.move
        (expect robot.orientation).to.equal 0

    describe 'turning left' !->

      specify 'orientation decreases by 1' !->
        robot = new Robot 1, 2, 'W', ['L']
        robot.move
        (expect robot.orientation).to.equal 2

      specify 'if orientation is 0 then will turn to 3' !->
        robot = new Robot 1, 2, 'N', ['L']
        robot.move
        (expect robot.orientation).to.equal 3

    describe 'moving forward' !->

      specify 'when facing north' !->
        robot = new Robot 1, 2, 'N', ['F']
        robot.move
        (expect robot.coordinates).to.equal [1, 3]

      specify 'when facing east' !->
        robot = new Robot 1, 2, 'E', ['F']
        robot.move
        (expect robot.coordinates).to.equal [2, 2]

      specify 'when facing south' !->
        robot = new Robot 1, 2, 'S', ['F']
        robot.move
        (expect robot.coordinates).to.equal [1, 1]

      specify 'when facing west' !->
        robot = new Robot 1, 2, 'W', ['F']
        robot.move
        (expect robot.coordinates).to.equal [0, 2]
