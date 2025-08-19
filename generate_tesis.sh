#!/bin/bash

qpdf MainDraft.pdf --pages MainDraft.pdf 2-z -- main_draft.pdf
qpdf --empty --pages cover/PortadaTesisMaestria.pdf main_draft.pdf -- Tesis-Esaú-Peralta.pdf
rm main_draft.pdf
