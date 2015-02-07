---
layout: default-devplatform
title: "Application Lifecycle Service Client Command Reference"
permalink: /als/v1/user/reference/client-ref/miscellaneous/
title: "Application Lifecycle Service Command Line Client Reference: Miscellaneous"
product: devplatform

---
<!--UNDER REVISION-->

# HP Helion Development Platform: ALS Command Reference: Miscellaneous

- [helion admin](#command-admin)
- [helion alias](#command-alias)	
- [helion aliases](#command-aliases)
- [colors](#command-Administration-Colors)
- [helion curl](#command-curl)
- [helion drain](#command-drain)
- [helion guid](#command-guid)
- [helion named-entities](#command-named-entities )
- [helion trace](#command-trace )
- [helion unalias](#command-unalias)

## Syntax

	helion [options] command [arguments] [command-options]
For more information, use the **helion help**, **helion help [*option*]**, or **helion options** commands.

<hr>

## helion aliases###
List the known aliases (shortcuts).

<table>
    <tr><td><b>Option</b></td><td><b>Description</b></td></tr>
    <tr><td>--json</td>
    <td>Print raw json as output, not human-formatted data.</td>
    </tr>    <tr><td>--no-prompt</td>
    <td>Disable interactive queries.</td>
    </tr>    <tr><td>--non-interactive</td>
    <td>Alias of --no-prompt.</td>
    </tr><tr>
    <td>--noprompt</td>
    <td>Alias of --no-prompt.</td>
    </tr><tr>
    <td>-n</td>
    <td>Alias of --no-prompt.</td>
    </tr>
</table>
### helion alias *\<name\* *\<command\*###
Create a shortcut for a command (prefix).

<table>
    <tr><td><b>Option</b></td><td><b>Description</b></td></tr>
    <tr><td>--no-prompt</td>
    <td>Disable interactive queries.</td>
    </tr>    <tr><td>--non-interactive</td>
    <td>Alias of --no-prompt.</td>
    </tr><tr>
    <td>--noprompt</td>
    <td>Alias of --no-prompt.</td>
    </tr><tr>
    <td>-n</td>
    <td>Alias of --no-prompt.</td>
    </tr>
</table>
### helion unalias *\<name\*###
Remove a shortcut by name.

<table>
    <tr><td><b>Option</b></td><td><b>Description</b></td></tr>
    <tr><td>--no-prompt</td>
    <td>Disable interactive queries.</td>
    </tr>    <tr><td>--non-interactive</td>
    <td>Alias of --no-prompt.</td>
    </tr><tr>
    <td>--noprompt</td>
    <td>Alias of --no-prompt.</td>
    </tr><tr>
    <td>-n</td>
    <td>Alias of --no-prompt.</td>
    </tr>
</table>

### helion admin exit###
Exit the shell. No-op if not in a shell.

<table>
    <tr><td><b>Option</b></td><td><b>Description</b></td></tr>
    <tr><td>--no-prompt</td>
    <td>Disable interactive queries.</td>
    </tr>    <tr><td>--non-interactive</td>
    <td>Alias of --no-prompt.</td>
    </tr><tr>
    <td>--noprompt</td>
    <td>Alias of --no-prompt.</td>
    </tr><tr>
    <td>-n</td>
    <td>Alias of --no-prompt.</td>
    </tr>
</table>
###helion admin help *\<cmdname\*###
Retrieve help for a command or command set. Without arguments help for all commands is given. The default format is --full.

<table>
    <tr><td><b>Option</b></td><td><b>Description</b></td></tr>
    <tr><td>--by-category</td>
    <td>Activate by-category form of the help.</td>
    </tr>    <tr><td>--full</td>
    <td>Activate full form of the help.</td>
    </tr>    <tr><td>--json</td>
    <td>Activate json form of the help.</td>
    </tr>    <tr><td>--list</td>
    <td>Activate list form of the help.</td>
    </tr>    <tr><td>--no-prompt</td>
    <td>Disable interactive queries.</td>
    </tr>    <tr><td>--non-interactive</td>
    <td>Alias of --no-prompt.</td>
    </tr><tr>
    <td>--noprompt</td>
    <td>Alias of --no-prompt.</td>
    </tr><tr>
    <td>--short</td>
    <td>Activate short form of the help.</td>
    </tr>    <tr><td>--width</td>
    <td>The line width to format the help for. Defaults to the terminal
    width, or 80 when no terminal is available.</td>
    </tr><tr>
    <td>-n</td>
    <td>Alias of --no-prompt.</td>
    </tr><tr>
    <td>-w</td>
    <td>Alias of --width.</td>
    </tr>
</table>
###helion curl *\<operation\* *\<path\* *\<header\*###
Run a raw rest request against the chosen target

<table>
    <tr><td><b>Option</b></td><td><b>Description</b></td></tr>
    <tr><td>--no-prompt</td>
    <td>Disable interactive queries.</td>
    </tr>    <tr><td>--no-trace</td>
    <td>Complementary alias of --trace.</td>
    </tr>    <tr><td>--non-interactive</td>
    <td>Alias of --no-prompt.</td>
    </tr><tr>
    <td>--noprompt</td>
    <td>Alias of --no-prompt.</td>
    </tr><tr>
    <td>--target</td>
    <td>The once-off target to use for the current operation.</td>
    </tr>    <tr><td>--token</td>
    <td>The once-off authentication token to use for the current
    operation.</td>
    </tr>    <tr><td>--token-file</td>
    <td>Path to an existing and readable file containing the targets and
    authorization tokens.</td>
    </tr>    <tr><td>--trace</td>
    <td>Activate tracing of the issued REST requests and responses. This
    option is a no-op now. Tracing is always active. See the 'trace'
    command to print the saved trace to stdout.</td>
    </tr><tr>
    <td>-n</td>
    <td>Alias of --no-prompt.</td>
    </tr><tr>
    <td>-t</td>
    <td>Alias of --trace.</td>
    </tr>
</table>
### helion debug-packages###
Show the packages used the client, and their versions.

<table>
    <tr><td><b>Option</b></td><td><b>Description</b></td></tr>
    <tr><td>--json</td>
    <td>Print raw json as output, not human-formatted data.</td>
    </tr>    <tr><td>--no-prompt</td>
    <td>Disable interactive queries.</td>
    </tr>    <tr><td>--non-interactive</td>
    <td>Alias of --no-prompt.</td>
    </tr><tr>
    <td>--noprompt</td>
    <td>Alias of --no-prompt.</td>
    </tr><tr>
    <td>-n</td>
    <td>Alias of --no-prompt.</td>
    </tr>
</table>
### helion drain exit###
Exit the shell. No-op if not in a shell.

<table>
    <tr><td><b>Option</b></td><td><b>Description</b></td></tr>
    <tr><td>--no-prompt</td>
    <td>Disable interactive queries.</td>
    </tr>    <tr><td>--non-interactive</td>
    <td>Alias of --no-prompt.</td>
    </tr><tr>
    <td>--noprompt</td>
    <td>Alias of --no-prompt.</td>
    </tr><tr>
    <td>-n</td>
    <td>Alias of --no-prompt.</td>
    </tr>
</table>
### helion drain help *\<cmdname\*###
Retrieve help for a command or command set. Without arguments help for all commands is given. The default format is --full.

<table>
    <tr><td><b>Option</b></td><td><b>Description</b></td></tr>
    <tr><td>--by-category</td>
    <td>Activate by-category form of the help.</td>
    </tr>    <tr><td>--full</td>
    <td>Activate full form of the help.</td>
    </tr>    <tr><td>--json</td>
    <td>Activate json form of the help.</td>
    </tr>    <tr><td>--list</td>
    <td>Activate list form of the help.</td>
    </tr>    <tr><td>--no-prompt</td>
    <td>Disable interactive queries.</td>
    </tr>    <tr><td>--non-interactive</td>
    <td>Alias of --no-prompt.</td>
    </tr><tr>
    <td>--noprompt</td>
    <td>Alias of --no-prompt.</td>
    </tr><tr>
    <td>--short</td>
    <td>Activate short form of the help.</td>
    </tr>    <tr><td>--width</td>
    <td>The line width to format the help for. Defaults to the terminal
    width, or 80 when no terminal is available.</td>
    </tr><tr>
    <td>-n</td>
    <td>Alias of --no-prompt.</td>
    </tr><tr>
    <td>-w</td>
    <td>Alias of --width.</td>
    </tr>
</table>
### helion exit###
Exit the shell. No-op if not in a shell.

<table>
    <tr><td><b>Option</b></td><td><b>Description</b></td></tr>
    <tr><td>--no-prompt</td>
    <td>Disable interactive queries.</td>
    </tr>    <tr><td>--non-interactive</td>
    <td>Alias of --no-prompt.</td>
    </tr><tr>
    <td>--noprompt</td>
    <td>Alias of --no-prompt.</td>
    </tr><tr>
    <td>-n</td>
    <td>Alias of --no-prompt.</td>
    </tr>
</table>
### helion groups exit###
Exit the shell. No-op if not in a shell.

<table>
    <tr><td><b>Option</b></td><td><b>Description</b></td></tr>
    <tr><td>--no-prompt</td>
    <td>Disable interactive queries.</td>
    </tr>    <tr><td>--non-interactive</td>
    <td>Alias of --no-prompt.</td>
    </tr><tr>
    <td>--noprompt</td>
    <td>Alias of --no-prompt.</td>
    </tr><tr>
    <td>-n</td>
    <td>Alias of --no-prompt.</td>
    </tr>
</table>
### helion groups help *\<cmdname\*###
Retrieve help for a command or command set. Without arguments help for all commands is given. The default format is --full.

<table>
    <tr><td><b>Option</b></td><td><b>Description</b></td></tr>
    <tr><td>--by-category</td>
    <td>Activate by-category form of the help.</td>
    </tr>    <tr><td>--full</td>
    <td>Activate full form of the help.</td>
    </tr>    <tr><td>--json</td>
    <td>Activate json form of the help.</td>
    </tr>    <tr><td>--list</td>
    <td>Activate list form of the help.</td>
    </tr>    <tr><td>--no-prompt</td>
    <td>Disable interactive queries.</td>
    </tr>    <tr><td>--non-interactive</td>
    <td>Alias of --no-prompt.</td>
    </tr><tr>
    <td>--noprompt</td>
    <td>Alias of --no-prompt.</td>
    </tr><tr>
    <td>--short</td>
    <td>Activate short form of the help.</td>
    </tr>    <tr><td>--width</td>
    <td>The line width to format the help for. Defaults to the terminal
    width, or 80 when no terminal is available.</td>
    </tr><tr>
    <td>-n</td>
    <td>Alias of --no-prompt.</td>
    </tr><tr>
    <td>-w</td>
    <td>Alias of --width.</td>
    </tr>
</table>
###helion guid *\<type\* *\<name\*###
Map the specified name into a uuid, given the type. This is an Application Lifecycle Service 3 specific command.
    
<table>
    <tr><td><b>Option</b></td><td><b>Description</b></td></tr>
    <tr><td>--json</td>
    <td>Print raw json as output, not human-formatted data.</td>
    </tr>    <tr><td>--no-prompt</td>
    <td>Disable interactive queries.</td>
    </tr>    <tr><td>--non-interactive</td>
    <td>Alias of --no-prompt.</td>
    </tr><tr>
    <td>--noprompt</td>
    <td>Alias of --no-prompt.</td>
    </tr><tr>
    <td>-n</td>
    <td>Alias of --no-prompt.</td>
    </tr>
</table>
### helion help *\<cmdname\*###
Retrieve help for a command or command set. Without arguments help for all commands is given. The default format is --full.

<table>
    <tr><td><b>Option</b></td><td><b>Description</b></td></tr>
    <tr><td>--by-category</td>
    <td>Activate by-category form of the help.</td>
    </tr>    <tr><td>--full</td>
    <td>Activate full form of the help.</td>
    </tr>    <tr><td>--json</td>
    <td>Activate json form of the help.</td>
    </tr>    <tr><td>--list</td>
    <td>Activate list form of the help.</td>
    </tr>    <tr><td>--no-prompt</td>
    <td>Disable interactive queries.</td>
    </tr>    <tr><td>--non-interactive</td>
    <td>Alias of --no-prompt.</td>
    </tr><tr>
    <td>--noprompt</td>
    <td>Alias of --no-prompt.</td>
    </tr><tr>
    <td>--short</td>
    <td>Activate short form of the help.</td>
    </tr>    <tr><td>--width</td>
    <td>The line width to format the help for. Defaults to the terminal
    width, or 80 when no terminal is available. </tr><tr>td></tr><tr>
    <td>-w</td>
    <td>Alias of --width.</td>
    </tr>
</table>
### helion named-entities###
List the entity types usable for 'guid'. I.e. the types of the
    named entities known to the client.
    
<table>
    <tr><td><b>Option</b></td><td><b>Description</b></td></tr>
    <tr><td>--json</td>
    <td>Print raw json as output, not human-formatted data.</td>
    </tr>    <tr><td>--no-prompt</td>
    <td>Disable interactive queries.</td>
    </tr>    <tr><td>--non-interactive</td>
    <td>Alias of --no-prompt.</td>
    </tr><tr>
    <td>--noprompt</td>
    <td>Alias of --no-prompt.</td>
    </tr><tr>
    <td>-n</td>
    <td>Alias of --no-prompt.</td>
    </tr>
</table>
### helion quota exit###
Exit the shell. No-op if not in a shell.
    
<table>
    <tr><td><b>Option</b></td><td><b>Description</b></td></tr>
    <tr><td>--no-prompt</td>
    <td>Disable interactive queries.</td>
    </tr>    <tr><td>--non-interactive</td>
    <td>Alias of --no-prompt.</td>
    </tr><tr>
    <td>--noprompt</td>
    <td>Alias of --no-prompt.</td>
    </tr><tr>
    <td>-n</td>
    <td>Alias of --no-prompt.</td>
    </tr>
</table>
### helion quota help *\<cmdname\>*###
Retrieve help for a command or command set. Without arguments, help for all commands is given. The default format is --full.
    
<table>
<tr><td><b>Option</b></td><td><b>Description</b></td></tr>
<tr><td>--by-category</td>
<td>Activate by-category form of the help.</td>
</tr>    <tr><td>--full</td>
<td>Activate full form of the help.</td>
</tr>    <tr><td>--json</td>
<td>Activate json form of the help.</td>
</tr>    <tr><td>--list</td>
<td>Activate list form of the help.</td>
</tr>    <tr><td>--no-prompt</td>
<td>Disable interactive queries.</td>
</tr>    <tr><td>--non-interactive</td>
<td>Alias of --no-prompt.</td>
</tr><tr>
<td>--noprompt</td>
<td>Alias of --no-prompt.</td>
</tr><tr>
<td>--short</td>
<td>Activate short form of the help.</td>
</tr>    <tr><td>--width</td>
<td>The line width to format the help for. Defaults to the terminal
width, or 80 when no terminal is available.</td> </tr><tr>
<td>-n</td>
<td>Alias of --no-prompt.</td>
</tr><tr>
<td>-w</td>
<td>Alias of --width.</td>
</tr>
</table>
### helion trace###
Print the saved REST trace for the last client command to stdout.
    
<table>
<tr><td><b>Option</b></td><td><b>Description</b></td></tr>
<tr><td>--no-prompt</td>
<td>Disable interactive queries.</td>
</tr>    <tr><td>--non-interactive</td>
<td>Alias of --no-prompt.</td>
</tr><tr>
<td>--noprompt</td>
<td>Alias of --no-prompt.</td>
</tr><tr>
<td>-n</td>
<td>Alias of --no-prompt.</td>
</tr></table>
