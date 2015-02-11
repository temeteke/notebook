\NeedsTeXFormat{pLaTeX2e}
\ProvidesClass{notebook}

\LoadClass[a4paper]{book}

\usepackage{fancyhdr}
\usepackage{etoolbox}

\DeclareOption{biblepaper}{
	\setlength{\paperwidth}{95truemm}
	\setlength{\paperheight}{171truemm}
	\special{papersize=95truemm,171truemm}
}
\ProcessOptions

\newlength{\vmargin}
\setlength{\vmargin}{3.18truemm}
\newlength{\hmargin}
\setlength{\hmargin}{3.18truemm}
\newlength{\bindingmargin}
\setlength{\bindingmargin}{13truemm}
\addtolength{\bindingmargin}{-\hmargin}

% portrait
%% top
\setlength{\voffset}{-1truein}
\addtolength{\voffset}{\vmargin}
\setlength{\topmargin}{0pt}
\setlength{\headheight}{7truemm}
\setlength{\headsep}{2truemm}
% bottom
\setlength{\footskip}{0pt}
\setlength{\textheight}{\paperheight}
\addtolength{\textheight}{-2\vmargin}
\addtolength{\textheight}{-\topmargin}
\addtolength{\textheight}{-\headheight}
\addtolength{\textheight}{-\headsep}
\addtolength{\textheight}{-\footskip}

% landscape
\setlength{\marginparwidth}{0pt}
\setlength{\marginparsep}{0pt}
%% left
\setlength{\hoffset}{-1truein}
\addtolength{\hoffset}{\hmargin}
\setlength{\oddsidemargin}{\bindingmargin}
\setlength{\evensidemargin}{0truemm}
%% right
\setlength{\textwidth}{\paperwidth}
\addtolength{\textwidth}{-2\hmargin}
\addtolength{\textwidth}{-\bindingmargin}

% font
\renewcommand{\sfdefault}{phv}
\renewcommand{\familydefault}{\sfdefault}

\pagestyle{fancy}
\patchcmd{\@fancyhead}{\rlap}{
	\color{darkgray}
	\fontsize{8pt}{8pt}\selectfont\rlap
}{}{}
\patchcmd{\headrule}{\hrule}{\color{lightgray}\hrule}{}{}
\patchcmd{\@fancyfoot}{\rlap}{\color{lightgray}\rlap}{}{}
\patchcmd{\footrule}{\hrule}{\color{lightgray}\hrule}{}{}

\lhead{}
\chead{}
\rhead{}
\lfoot{}
\cfoot{}
\rfoot{}
