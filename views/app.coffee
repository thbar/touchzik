window.start_playing = (client) =>
  stage = new Kinetic.Stage({
    container: "container",
    width: 960, 
    height: 600
  })

  shapesLayer = new Kinetic.Layer()

  touchstart = (index, target) ->
    (event) ->
      client.publish('/sound', {event: 'touchstart', pad: index})

  touchend = (index, target) ->
    () ->
      client.publish('/sound', {event: 'touchend', pad: index})

  interpolate = (start, end, i) ->
    Math.ceil(start + (end - start) * i)

  createCircle = (x, y, r, index) =>

    red = interpolate(40, 255, index / 100.0)
    green = interpolate(30, 255, index / 40.0)
    blue = interpolate(50, 255, index / 50.0 )

    circle = new Kinetic.RegularPolygon({
      sides: 4
      radius: r * 1.5
      x: x
      y: y
      rotation: 3.14 / 4.0
      strokeWidth: 5
      fill: "rgb(#{red}, #{green}, #{blue})"
      stroke: "rgb(#{red-8}, #{green-8}, #{blue-8})"
    })

    circle.on("touchstart", touchstart(index, circle))
    circle.on("mousedown", touchstart(index, circle))
    circle.on("touchend", touchend(index, circle))
    circle.on("mouseup", touchend(index, circle))

    shapesLayer.add(circle)

  for x in [0..7]
    for y in [0..2]
      createCircle(90 + x * 112, 100 + 80 + y*115, 45, y * 8 + x)

  stage.add(shapesLayer)


