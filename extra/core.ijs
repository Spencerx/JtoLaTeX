toString =: ;@:treetotex@:tonode :. toL
toStrings=: treetotex@:tonode"0

concat =: (<<,',') on ,&tonode

mathinline =: ('$$'surround) &.: toString
mathdisp =: ('\[',:'\]')surround &.: toString

NB. non-printing assignment operator
is =: 4 :'empty (>x) =: y'

declare =: (1 :('''EMPTY'';~''(>x)=:'',u')) (4 :)~~(&>) (&:(;:^:(0=L.)))
DeclareConst =: 'toL ''\'',y' declare
DeclareFunc =: '(<''\'',y) on ,&tonode' declare
DeclareOp =: '(<''\\'',y) on ,&tonode' declare
