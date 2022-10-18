#!/usr/bin/python3
#-*- coding: utf-8 -*-

import os, sys
import curses
from struct import *
from time import time, strftime, gmtime

class Lesson(object):

    def __init__(self, lesson_name):

        self.load_lesson(lesson_name)
        self.text_typed = ''
        self.current_line = 0
        self.text_char_count = 0

        self.stime = 0.0
        self.etime = 0.0
        self.lesson_total_time = 0.0
        self.lesson_name = lesson_name
        self.wrong = 0
        self.correct = 0

    def load_lesson(self, filename):
        fh = open('data/%s' % str(filename))
        self.text = fh.read()
        fh.close()
        self.text_count = len(self.text)
        self.text_lines = self.text.split('\n')

    def is_correct(self, char):
        if char == self.text[len(self.text_typed)]:
            return True
        else:
            return False

    def start(self):
        self.stime = time()

    def end(self):
        self.etime = time()

    def increase(self, boolean):
        if boolean:
            self.correct += 1
        else:
            self.wrong += 1

    def addchar(self, char):
        self.text_typed += char

    def info(self):
        print('nazwa lekcji', self.lesson_name )
        self.lesson_total_time = self.etime - self.stime
        print(strftime("%H:%M:%S", gmtime(self.lesson_total_time)) )
        print('typed', len(self.text_typed) )
        print('poprawnych', self.correct )
        print('niepoprawnych', self.wrong )
        print('text long', str(self.text_count) )
        print('znaków na minute', (len(self.text_typed)/self.lesson_total_time) * 60 )
        print('znakow poprawnych na minute', (self.correct/self.lesson_total_time) * 60 )

class Ekran(object):

    def __init__(self):
        self.stdscr = curses.initscr()
        self.cursor_x = 0
        self.cursor_y = 0
        self.typing_cursor_x = 0
        self.typing_cursor_y = 0
        self.textpos = 2

    def cout(self, string):
        """ Print string on curses screen and jump to new line """
        self.stdscr.addstr(self.cursor_y, self.cursor_x, str(string))
        self.cursor_x = 0
        self.cursor_y += 1

    def char(self, char):
        """ Prints char on curses screen """
        self.stdscr.addstr(self.typing_cursor_y, self.typing_cursor_x, char)
        self.typing_cursor_x += 1

    def cursor_position(self):
        """ Return cursor position """
        return [str(self.cursor_y), str(self.cursor_x)]

    def cursor_goto(self, y, x):
        """ Set cursor position """
        self.cursor_y = y
        self.cursor_x = x

    def new_line(self):
        """ Go to new line """
        self.cursor_x = 0
        self.cursor_y += 1
        self.typing_cursor_x = 0
        self.typing_cursor_y += 1

    def clear_screen(self):
        self.stdscr.erase()

    def clear_line(self):
        self.stdscr.addstr(self.textpos-1, 0, "".join([ " " for x in range(80) ]))

    def set_text_coordinates(self):
        self.cursor_x = 0
        self.cursor_y = self.textpos

    def textpos_newline(self):
        self.textpos += 1


if sys.argv[1:]:

    e = Ekran()
    curses.noecho(); e.stdscr.keypad(1); curses.curs_set(1)

    lekcja = Lesson(sys.argv[1])
    e.set_text_coordinates()
    e.cout( '\n'.join(lekcja.text_lines[:4]))
    lekcja.current_line += 1
    e.textpos_newline()
    e.cursor_goto(0, 0)

    lekcja.start()
    while 1:
        c = e.stdscr.getch()
        if c == 27:
            break
        else:
            userchar = chr(c)
            try:
                filechar = lekcja.text[len(lekcja.text_typed)]
            except:
                break

            if lekcja.is_correct(userchar):
                e.char(userchar)
                lekcja.increase(True)
            else:
                lekcja.increase(False)
                e.char("E")
            lekcja.addchar(userchar)
        if filechar == "\n":
            e.new_line()
            e.clear_line()
            e.set_text_coordinates()
            e.cout( '\n'.join(lekcja.text_lines[lekcja.current_line:lekcja.current_line+4]))
            lekcja.current_line += 1
            e.textpos_newline()
    
    lekcja.end()
    e.stdscr.keypad(0); curses.echo(); curses.endwin(); curses.curs_set(1)
    lekcja.info()

else:
    print('podaj numer lekcji' )
    print(' '.join([ x for x in os.listdir('data') ]) )




