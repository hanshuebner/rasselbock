# rasselbock - A http server written in VAX LISP

![rasselbock](https://raw.githubusercontent.com/hanshuebner/rasselbock/master/public/rasselbock.jpg)

rasselbock is a web server written in VAX LISP.  I wrote it for fun,
to learn how to program in VAX LISP and in particular how to interface
with VMS system services and the Record Management Services (RMS).

# Prerequisites

 * OpenVMS V5.5-2 on VAX
 * VAX LISP V3.1
 * TCP/IP Services for OpenVMS (UCX) V4.2

# Features

 * Implements HTTP/1.0 (no persistent connections)
 * Request routing based on HTTP method and URI
 * Serves binary and text files from the file system

# Code tour

## rasselbock.lsp

Implements listening to a TCP socket, accepting connections, reading
of request line and headers and writing of response headers.  

## response.lsp

Defines the structure of a response as returned from a handler.

## file-response.lsp

Implements reading of files from the VMS file system and writing to
the client socket.  As VAX LISP does not provide efficient routines to
access binary files, such files are read using direct calls to the VMS
Record Management System (RMS).

## dispatch.lsp

Routing of http requests to handlers.  This is where requests to "/"
are rerouted to the index.html file.

## utils.lsp

Utility functions and macros not specific to Rasselbock.

## vms.lsp

Structures, functions and macros to help interacting with VMS system
services.

## parameters.lsp

Parameters global to Rasselbock (i.e. buffer sizes).

## editor-commands.lsp

Customizations to the VAX LISP editor to add features that I have
missed.
