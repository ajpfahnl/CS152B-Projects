import pygame
import time
import random
import serial
import os
from pygame import mixer

s = serial.Serial('/dev/tty.RNBT-61DE',timeout=0)

pygame.init()
mixer.init()

bite_base_path = os.path.dirname(__file__)
bite_path = os.path.join(bite_base_path, "appleBite.mp3")
bite_sound = mixer.Sound(bite_path)

lose_base_path = os.path.dirname(__file__)
lose_path = os.path.join(lose_base_path, "lose.wav")
lose_sound = mixer.Sound(lose_path)

white = (255, 255, 255)
yellow = (255, 255, 102)
black = (0, 0, 0)
red = (213, 50, 80)
green = (0, 255, 0)
blue = (50, 153, 213)
 
total_height = 640
dis_width = 600
dis_height = 600
 
dis = pygame.display.set_mode((dis_width, total_height))
pygame.display.set_caption('Snake')

grass_base_path = os.path.dirname(__file__)
grass_path = os.path.join(grass_base_path, "grass.jpeg")
bg = pygame.image.load(grass_path)

clock = pygame.time.Clock()
 
snake_block = 15
snake_speed = 5
 
font_style = pygame.font.SysFont("Arial", 25)
score_font = pygame.font.SysFont("Arial", 35)
 
def Your_score(score):
    value = score_font.render("SCORE: " + str(score), True, yellow)
    score_rect = value.get_rect(midtop=(dis_width/2, 0))
    dis.blit(value, score_rect)
 
def our_snake(snake_block, snake_list):
    for x in snake_list:
        # snake head
        if(x == snake_list[-1]):
            pygame.draw.rect(dis, black, [x[0], x[1], snake_block, snake_block], 0, 3)
            # eyes
            pygame.draw.circle(dis, yellow, [x[0]+3, x[1]+5], 3)
            pygame.draw.circle(dis, yellow, [x[0]+12, x[1]+5], 3)
            # pupils
            pygame.draw.line(dis, black, [x[0]+3, x[1]+2], [x[0]+3, x[1]+8])
            pygame.draw.line(dis, black, [x[0]+12, x[1]+2], [x[0]+12, x[1]+8])
        # snake body
        else:
            pygame.draw.rect(dis, black, [x[0], x[1], snake_block, snake_block], 0, 3)
 
def message(msg, textcolor, bgcolor):
    mesg = font_style.render(msg, True, textcolor, bgcolor)
    mesg_rect = mesg.get_rect(center=(dis_width/2, dis_height/2))
    dis.blit(mesg, mesg_rect)
 
def gameLoop():
    game_start = True
    game_over = False
    game_close = False
 
    x1 = dis_width / 2 
    y1 = dis_height / 2
 
    x1_change = 0
    y1_change = 0
 
    snake_List = []
    Length_of_snake = 1
    snake_speed = 5
 
    foodx = round(random.randrange(0, dis_width - snake_block) / 15.0) * 15.0
    foody = round(random.randrange(40, dis_height - snake_block) / 15.0) * 15.0
 
    while not game_over:
        
        res = s.read().decode()
        res = ""

        while game_start == True:
            dis.fill(black)
            message("s (SLOW), m (MEDIUM) OR f (FAST)?", white, black)
            pygame.display.update()
            for event in pygame.event.get():
                if event.type == pygame.KEYDOWN:
                    if event.key == pygame.K_s:
                        snake_speed = 4
                        game_start = False
                    elif event.key == pygame.K_m:
                        snake_speed = 7
                        game_start = False
                    elif event.key == pygame.K_f:
                        snake_speed = 10
                        game_start = False
                    else:
                        snake_speed = 7
                        game_start = False
                if event.type == pygame.QUIT:
                    game_over = True
                    game_close = False
                    game_start = False
            
            if(res == 's'):
                snake_speed = 4
                game_start = False
            elif(res == 'm'):
                snake_speed = 7
                game_start = False
            elif(res == 'f'):
                snake_speed = 10
                game_start = False



        while game_close == True:
            dis.fill(black)
            message("YOU LOSE! C TO PLAY AGAIN OR Q TO QUIT", white, black)
            Your_score(Length_of_snake - 1)
            pygame.display.update()
            
            for event in pygame.event.get():
                if event.type == pygame.KEYDOWN:
                    if event.key == pygame.K_q:
                        game_over = True
                        game_close = False
                    if event.key == pygame.K_c:
                        gameLoop()
            #res = s.read().decode()
            if(res == 'q'):
                game_over = True
                game_close = False
            elif(res == 'c'):
                gameLoop()



        if(res == 'a'):
            x1_change = -snake_block
            y1_change = 0
        elif (res == 'd'):
            x1_change = snake_block
            y1_change = 0
        elif (res == 'w'):
            y1_change = -snake_block
            x1_change = 0
        elif (res == 's'):
            y1_change = snake_block
            x1_change = 0

        for event in pygame.event.get():
            if event.type == pygame.QUIT:
                game_over = True
            if event.type == pygame.KEYDOWN:
                if event.key == pygame.K_LEFT:
                    x1_change = -snake_block
                    y1_change = 0
                elif event.key == pygame.K_RIGHT:
                    x1_change = snake_block
                    y1_change = 0
                elif event.key == pygame.K_UP:
                    y1_change = -snake_block
                    x1_change = 0
                elif event.key == pygame.K_DOWN:
                    y1_change = snake_block
                    x1_change = 0
 
        if x1 >= dis_width or x1 < 0 or y1 >= dis_height or y1 < 40:
            game_close = True
            mixer.Sound.play(lose_sound)
        x1 += x1_change
        y1 += y1_change
        
        dis.fill(black)
        dis.blit(bg, (0, 40))
        pygame.draw.rect(dis, red, [foodx, foody, snake_block, snake_block], 0, 5)
        # stem
        pygame.draw.line(dis, black, [foodx+7, foody+5], [foodx+8, foody], 2)
        # leaf
        pygame.draw.polygon(dis, green, [(foodx+7, foody+5), (foodx+11, foody+3), (foodx+15, foody+5), (foodx+11, foody+7)])
        
        snake_Head = []
        snake_Head.append(x1)
        snake_Head.append(y1)
        snake_List.append(snake_Head)
        if len(snake_List) > Length_of_snake:
            del snake_List[0]
 
        #snake bites itself
        for x in snake_List[:-1]:
            if x == snake_Head:
                game_close = True
                mixer.Sound.play(lose_sound)
 
        our_snake(snake_block, snake_List)
        Your_score(Length_of_snake - 1)
 
        pygame.display.update()
 
        if x1 == foodx and y1 == foody:
            foodx = round(random.randrange(0, dis_width - snake_block) / 15.0) * 15.0
            foody = round(random.randrange(40, dis_height - snake_block) / 15.0) * 15.0
            Length_of_snake += 1
            mixer.Sound.play(bite_sound)
            s.write('u');
 
        clock.tick(snake_speed)
 
    pygame.quit()
    quit()
 
 
gameLoop()
