Overview and Use:

The Lisp program 'ternary tree' will take in a list of integers from the user 
and place them into a initially empty ternary tree. The elements will be placed
in the order they appear in the list. As each element is placed into the tree,
the tree will be printed to the user's screen. Each node contains two element 
and possibly three children. A node can only have children if it has two 
elements. The left child of the node contains values that are smaller than or 
equal to the smallest element of the node. The middle child contains values that
are greater than the smallest element and smaller than or equal to the largest 
element of the node. The right child contains the values that are greater than
the largest element of the node. These rules apply for each child of the node
as well, giving the ternary tree it's structure. 

Compilation and Running Instructions:

The ternary tree program must be compiled in a Unix environment. A Makefile has
been included in the same package as this file that will initiate the proper 
Lisp environment with the ternary tree program loaded. If GNU Common Lisp is 
installed on the user's Unix machine, the following command will initiate the 
Lisp environment:

	make

Once the Lisp environment has been initiated, the following command will set up
the ternary tree program so that it will accept a command line list of elements.

	(run)

The following command will allow the ternary tree program to accept the name of
a file that contains a list of elements to build a tree.

	(runFromFile)

The following command will exit the Lisp environment and ternary tree program.
	
	(quit)

NOTE: The ternary tree program can be changed to loop constantly and keep 
accepting lists or filenames by uncommenting lines 103 and 110 in the 
ternaryTree.txt file. However, there is no way to exit the loop without a 
Ctrl-D command or entering bad input and a (quit) command.
