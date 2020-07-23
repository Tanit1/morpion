# morpion

============================= INIT =================================

INIT DES JOUEURS  = nom, couleur, score

====================================================================



============================ BOUCLE ================================

  MENU                  = play, reset, quit
  CHOIX UTILISATEUR     = 1, 2, 3 (start, reset, quit)

  START =>
    ======================== BOUCLE ================================
      AFFICHE LE TABLEAU (3x3)
      DEMANDE JOUEUR 1  = A1 - A2 - A3 - B1 - B2 - B3 - C1 - C2 - C3
      ACTION            = DESSINE → CERCLE ET BG_VERT
      DEMANDE JOUEUR 2  = A1 - A2 - A3 - B1 - B2 - B3 - C1 - C2 - C3
      ACTION            = DESSINE → CROIX ET BG_ROUGE
    ================================================================
  END =>
    AFFICHE LE GAGNANT OU MATCH NUL
    MET A JOUR LES SCORES
    VIDE LE TABLEAU
    RETOUR AU MENU

  RESET =>
    REINITIALISE LES SCORES = RETOUR MENU

====================================================================

QUIT =>
  FERME LE JEU = RETOUR TERMINAL