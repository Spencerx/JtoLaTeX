mean =: (+/%#)"1
stddev =: (+/%<:@#)&.:*:@:(-mean)"1
stderr =: stddev % %:@#"1
dot =: +/@:*
corrsq =: (*:@dot % *&(dot~))&(-mean)"1
corr =: %:@corrsq   NB. correlation coefficient R
slopeRU =: [:%: (2-~#"1@]) %~ <:@%@corrsq
intRU =: slopeRU*mean&.:*:@[
int_slope =: (1,.[)%.~]
int_slopeWithU =: int_slope ([ ,. {:@[|@*]) intRU,slopeRU

NB. All format commands output a double-boxed string. Careful!
fmtExp =: ([,'\times10^{',],'}'"_)&(('-',}.)^:('_'={.))&":&.>&.>
fmtDig =: <@:(":@[ 8!:0 ]) "0
genFmtPrec =: (1 :0) ("0) NB. precision (expcutoff genFmtPrec) number
:
  exp =. 10 <.@^. |y
  if. u>:|exp-0.5 do. (0>.x->:exp) fmtDig y
  else. ((<:x) fmtDig y%10^exp) fmtExp toL exp end.
)
fmtPrec =: 3 genFmtPrec
fmtU =: _ genFmtPrec~ 1+1.95>(%<.&.(10&^.))
fmtWithU =: 3 :0 "1
  nd =. >:-/ exp=. 10<.@^. 'N U'=.y
  if. 3>:|0.5-~{.exp do. (nd fmtPrec N)([,'\pm',])&.>&.>(fmtU U)
  else. (('(',,&')')&.>&.>fmtWithU y%10^{.exp) fmtExp {.exp end.
)
Umean =: ([: fmtWithU mean,stderr)"1

unit =: (,&)asL("0)
textrm =: '\textrm'&texa asL
tunit =: (1 :'''\,\textrm{'',m,''}''')unit

calcwithU =: 1 :'(u@{.([,|@-)u@(+/))"1'
mcalcwithU =: 1 :0 ("2)
  ({."1 y) (u@[ ([, +/&.:*:@:-~) u@:+"1) (*=@i.@#){:"1 y
)