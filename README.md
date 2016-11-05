# Math

Simple demonstration of supervision by setting up a `Math.Calculate` module that has a method `divide`. If a divide by zero occurs then the process gets restarted.

In `mix.exs`, the `Math` supervisor gets kicked off via:

```
  def application do
    [applications: [:logger],
     mod: {Math, []}
    ]
  end
```

In the Math supervisor, it kicks off and supervises the `Math.Calculate` worker process.
Thus, when you fire up `iex -S mix` it'll start up the `Math` supervisor and the `Math.Calculate` worker process for you!

So then I can call the `divide` function:

```
> Math.Calculate.divide(10,2)
5.0
:ok

> Math.Calculate.divide(34,3)
11.333333333333334
:ok

> Math.Calculate.divide(34,0)
A BIG UGLY ERROR MESSAGE... BUT LITTLE DID YOU KNOW THE PROCESS WAS RESTARTED AND LIVES!

> Math.Calculate.divide(34,2)
17.0
:OK

```

![alt tag](https://github.com/kblake/simple-supervision/blob/master/dividebyzerosupervision.gif)

