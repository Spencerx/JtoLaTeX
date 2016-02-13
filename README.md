This is JtoLaTeX, a compiler which writes LaTeX files using J evaluation
for the hard bits.

This project aims to be extensible, and to interface well with J.
A natural corollary of this behavior will be a particularly powerful
formatting language.

The script `jlatex` can be run on a document, and will compile it to a
.tex document and then run pdflatex on that.

To install,
```shell
$ cd ~user/
$ git clone git://github.com/mlochbaum/JtoLaTeX.git
# ln -s JtoLaTeX/jlatex /usr/bin/jlatex
```
where ~user is given by
```J
   jpath '~user'
```
in J.

Documents are written in LaTeX, except that a section enclosed in an
escape like `\L()` will be executed according to the verb `L_pjdoc_` in
jdoc.ijs. In particular, `L` converts a J expression into an "equivalent"
LaTeX expression, sending `'2+^~<:5'` to `'2+(5-1)^{5-1}'`, for example.

This allows you to do many J things in LaTeX, like computations, tables,
and plots.

See doc/introduction for some (not very extensive) guidance and examples
of JtoLaTeX code.

Handling of built-in functions can be configured in opdata.ijs, and
functionality can be added by writing a script in the extra folder.

This version includes the filepath `'~user/JtoLaTeX/'` in the file jlatex,
which must be changed if you want to install somewhere else.
