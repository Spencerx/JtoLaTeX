of =: toL @: (>@{. , rowvec@}.) @: toStrings@:,

NB. analogous to \mathop ; returns an operator that takes a set of limits
NB. 'l^u' on the left and an argument on the right.
toBound =: '_^' texa1&.>(;@:) toStrings
mathop =: 1 :0
((< '\\',u) on ,&tonode) : (([:< '\\',u,toBound@[) on ,&tonode@]) " 1 0
)

DeclareMathSumOp =: 'y mathop' declare
DeclareMathSumOp (LF;' ') rplc~ 0 :0
sum       prod       coprod
bigoplus  bigotimes  bigodot
bigcup    bigcap     biguplus
bigsqcup  bigvee     bigwedge
int       oint       iint
iiint     iiiint     idotsint
)

DeclareMathOp 'sin cos tan'
