%% yqart.cls 2023-10-29
%% Copyright (C) 2023 Foo Yong Qi
% This work may be distributed and/or modified under the
% conditions of the LaTeX Project Public License, either version 1.3
% of this license or (at your option) any later version.
% The latest version of this license is in
%   http://www.latex-project.org/lppl.txt
% and version 1.3 or later is part of all distributions of LaTeX
% version 2003/12/01 or later.
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{yqart}
[2023/10/29 v0.1 Yong Qi Foo's article format]
\LoadClass[12pt,a4paper,twoside]{article}
\raggedbottom

%%%%%%%%%%%%%%%%% Packages %%%%%%%%%%%%%%%%%%%%%%
% margins
\RequirePackage[left=0.8in,right=0.8in,top=1in,bottom=0.8in]{geometry}

% math
\RequirePackage{amsmath}
\RequirePackage{amssymb}
\RequirePackage{amsthm}
\RequirePackage{aliascnt} % for proper autorefs

\newtheoremstyle{yqthm}{10pt}{}{\slshape}{}{\scshape}{.}{ }{}
\theoremstyle{yqthm}

\newtheorem{theorem}{Theorem}[section]

\newaliascnt{lemma}{theorem}
\newtheorem{lemma}[lemma]{Lemma}
\aliascntresetthe{lemma}

\newaliascnt{corollary}{theorem}
\newtheorem{corollary}[corollary]{Corollary}
\aliascntresetthe{corollary}

\newaliascnt{proposition}{theorem}
\newtheorem{proposition}[proposition]{Proposition}
\aliascntresetthe{proposition}

\newaliascnt{conjecture}{theorem}
\newtheorem{conjecture}[conjecture]{Conjecture}
\aliascntresetthe{conjecture}

\newtheorem{manualtheoreminner}{Theorem}
\newenvironment{manualtheorem}[1]{%
  \renewcommand\themanualtheoreminner{#1}%
  \manualtheoreminner
}{\endmanualtheoreminner}

\newtheorem{manuallemmainner}{Lemma}
\newenvironment{manuallemma}[1]{%
  \renewcommand\themanuallemmainner{#1}%
  \manuallemmainner
}{\endmanuallemmainner}
\theoremstyle{definition}

\newaliascnt{definition}{theorem}
\newtheorem{definition}[definition]{Definition}
\aliascntresetthe{definition}

\theoremstyle{remark}

\newtheorem{example}{Example}[section]

\newaliascnt{remark}{example}
\newtheorem{remark}[remark]{Remark}
\aliascntresetthe{remark}

\RequirePackage{algorithm}
\RequirePackage[noend]{algpseudocode}
\algnewcommand\algorithmicforeach{\textbf{for each}}
\algdef{S}[FOR]{ForEach}[1]{\algorithmicforeach\ #1\ \algorithmicdo}

\RequirePackage{ebproof}

% headers
\RequirePackage{fancyhdr}
\fancyhead{}
\pagestyle{fancy}
\thispagestyle{empty}
\makeatletter
\fancyhead[LE]{
\ifx\@subtitle\undefined
    \sffamily\small\@title
\else
    \sffamily\small\textbf{\@title}\textemdash\@subtitle
\fi
}
\fancyhead[RO]{
\sffamily\small
\@author
}
\makeatother
\renewcommand{\headrulewidth}{0pt}

% fonts
\RequirePackage[utf8]{inputenc} % allow utf-8 input
\RequirePackage[T1]{fontenc}    % use 8-bit T1 fonts
\RequirePackage{nicefrac}       % compact symbols for 1/2, etc.
\RequirePackage{microtype}      % microtypography
\RequirePackage{libertine}
\RequirePackage{inconsolata}
\RequirePackage[libertine]{newtxmath}
\RequirePackage{textcase}

% graphics
\RequirePackage{xcolor}
\RequirePackage{graphicx}
\RequirePackage{wrapfig}
\RequirePackage{subcaption}
\RequirePackage{tikz}
\RequirePackage{booktabs}
\RequirePackage{listings}
\lstdefinestyle{yqstyle}{
    columns=fullflexible,
    basicstyle=\ttfamily,
    breakatwhitespace=false,         
    breaklines=true,                 
    captionpos=b,                    
    keepspaces=true,                 
    numbers=left,                    
    numbersep=5pt,                  
    showspaces=false,                
    showstringspaces=false,
    showtabs=false,                  
    tabsize=2,
    aboveskip=0pt,
    belowskip=0pt
}
\lstset{style=yqstyle}

% captions
\RequirePackage{caption, float}
\captionsetup[table]{position=top}
\DeclareCaptionFormat{yq}{\sffamily\textbf{#1#2}#3}
\captionsetup{format=yq}

\RequirePackage{hyperref}       % hyperlinks
\hypersetup{
colorlinks=true,
linkcolor=violet,
filecolor=violet,
urlcolor=violet,
citecolor=violet
}
\def\sectionautorefname{Section}
\def\subsectionautorefname{Subsection}
\def\figureautorefname{Figure}
\def\tableautorefname{Table}
\def\lemmaautorefname{\textsc{Lemma}}
\def\theoremautorefname{\textsc{Theorem}}
\def\corollaryautorefname{\textsc{Corollary}}
\def\propositionautorefname{\textsc{Proposition}}
\def\conjectureautorefname{\textsc{Conjecture}}
\def\definitionautorefname{\textbf{Definition}}
\def\exampleautorefname{\textit{Example}}
\def\remarkautorefname{\textit{Remark}}
\def\algorithmautorefname{Algorithm}

% title formatting
\RequirePackage[explicit]{titlesec}

\titleformat{\section}
  {\large\bfseries\sffamily}{\thesection}{1em}{\MakeUppercase{#1}}

\titleformat{\subsection}
  {\bfseries\sffamily}{\thesubsection}{1em}{#1}

\titleformat{\subsubsection}[runin]
  {\normalfont\normalsize\bfseries}{\thesubsubsection}{1em}{\normalfont\emph{#1}.}

\titleformat{\paragraph}[runin]
  {\normalfont}{\theparagraph}{1em}{\normalfont\emph{#1}.}

%%%%%% Title Page %%%%%%%
% Markless footnote
\newcommand\blfootnote[1]{%
  \begingroup
  \renewcommand\thefootnote{}\footnote{#1}%
  \addtocounter{footnote}{-1}%
  \endgroup
}

% Authors
\makeatletter
\newif\if@defauthor
\newif\if@defemail
\newif\if@defwebsite
\newif\if@defaff

\def\@author{}
\renewcommand{\author}[1]{
\ifx\@lastauthor\undefined
    \edef\@lastauthor{#1}
    \def\@author{\@lastauthor}
    \def\@addressimpl{Addresses: \textbf{\textsf{\MakeUppercase{#1}}}}
\else
    \ifx\@firstauthors\undefined
        \edef\@firstauthors{\@lastauthor}
        \edef\@lastauthor{#1}
    \else
        \edef\@firstauthors{\@firstauthors , \@lastauthor}
        \edef\@lastauthor{#1}
    \fi
    \def\@author{\@firstauthors\ and \@lastauthor}
    \if@defaff
    \g@addto@macro\@addressimpl{. \textbf{\textsf{\MakeUppercase{#1}}}}
    \else
    \g@addto@macro\@addressimpl{; \textbf{\textsf{\MakeUppercase{#1}}}}
    \fi
\fi
\@defauthortrue
\@defemailfalse
\@defafffalse
\@defwebsitefalse
}

\def\@addresses{
\ifx\@addressimpl\undefined
\else
    \blfootnote{\@addressimpl .}
\fi
}

\newcommand{\email}[1]{
\if@defauthor
\else 
    \PackageError{yqart}{You can only add email addresses immediately after adding an author!}
\fi
\if@defemail
    \PackageError{yqart}{You can only add one email address for each author}
\fi
\g@addto@macro\@addressimpl{, Email: \texttt{#1}}
\@defemailtrue
}

\newcommand{\affiliation}[1]{
\if@defaff
\PackageError{yqart}{You can only add affiliations after defining authors!}
\fi
\g@addto@macro\@addressimpl{, \textit{#1}}
\@defauthorfalse
\@defemailfalse
\@defwebsitefalse
\@defafftrue
}

\newcommand{\website}[1]{
\if@defauthor
\else 
\PackageError{yqart}{You can only add personal websites after adding an author}
\fi
\if@defwebsite
\PackageError{yqart}{You cannot define personal websites for an author twice}
\fi
\g@addto@macro\@addressimpl{, Website: \url{#1}}
\@defwebsitetrue
}
\makeatother

%%%%% Abstract and Keywords %%%%%%%
\newenvironment{abstracttext}{\small}{}
\renewenvironment{abstract}{\noindent\begin{abstracttext}\textbf{\textsf{ABSTRACT}}. }{\end{abstracttext}
\medskip
}
\newcommand{\keywords}[1]{\noindent \textbf{Keywords}: \sffamily#1\normalfont}



%%%%%%%% \maketitle %%%%%%%%%%%%%%%

\makeatletter
\def\mksubtitle{\ifx\@subtitle\undefined\else{\normalfont\large\sffamily\@subtitle\\}\fi}
\newcommand{\subtitle}[1]{\def\@subtitle{#1}}
\def\maketitle{
{
\begin{flushleft}
\Large\sffamily\bfseries\@title\\
\mksubtitle
\large\normalfont\sffamily{\@author}\@addresses\\
\normalfont\normalsize\@date
\end{flushleft}
}
}
\makeatother


