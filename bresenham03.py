#!/usr/bin/python
'''
Bresenham's line algorithm

The algorithm
Wersja z optymalizacja dla maszyn bez obliczen zmiennoprzecinkowych.
'''

from math import fabs
import pygame

SCREEN_X = 640
SCREEN_Y = 480

screen = pygame.display.set_mode((SCREEN_X, SCREEN_Y))
screen.fill((0,0,0))

pxarray = pygame.PixelArray(screen)
pxarray[10,400] = (255,255,255)

def osx(y):
    for x in range(SCREEN_X):
        pxarray[x,y] = (250,50,100)

# Narysuj linie poziome na wyznaczonych wysokosciach
for y in range(11):
    osx(y)
osx(100)
osx(200)
osx(300)
osx(400)

# Wlasciwy algorytm
def linia(ax, ay, bx, by):
    print( 'line coords:', (ax, ay), (bx, by) )

    steep = fabs(by - ay) > fabs(bx - ax)
    if steep:
        tmp = ax
        ax = ay
        ay = tmp

        tmp = bx
        bx = by
        by = tmp

    # Bez tego warunku linie rysowane sa tak samo dobrze
    # Wiec chyba jest on zbedny - do sprawdzenia w przyszlosci
    if ax > bx:
        tmp = ax
        ax = bx
        bx = tmp

        tmp = ay
        ay = by
        by = tmp

    dx = bx - ax
    dy = fabs(by - ay)
    error = dx / 2 # dx >> 1 - dzielenie przez dwa to przesuniecie o jeden bit
    y = ay
    ystep = 1 if ay < by else -1

    for x in range(ax, bx):
        if steep:
            pxarray[ y, x ] = (255,255,255)
        else:
            pxarray[ x, y ] = (255,255,255)
            error -= dy
            if error < 0:
                y += ystep
                error += dx

linia(0, 0, 400, 400)
linia(10, 0, 390, 400)
linia(10, 100, 390, 200)
linia(0, 400, 400, 0)
linia(100,0, 200,400)

# Narysuj kilka linii rozchodzacych sie z jednego punktu
for y in range(0, 400, 20):
    linia(0, y, 400, 400)

pygame.display.flip()
running = 1
while running:
    event = pygame.event.poll()
    if event.type == pygame.QUIT or (event.type == pygame.KEYDOWN and event.key == pygame.K_ESCAPE):
        running = 0
