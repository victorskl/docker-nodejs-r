hello <- function( name ) {
    sprintf( "Hello, %s from R.", name );
}

# hello('victor');

args = commandArgs(trailingOnly=TRUE);
hello(args[1]);
