require 'Gosu'

class Mole < Gosu::Window 

    def initialize 
        super 800, 600 
        self.caption = "Tutorial Game"
        @x_coordinate_screen = 800
        @y_coordinate_screen = 600
        @hammer = Gosu::Image.new('Sprites/hammer.png')
        @ruby = Gosu::Image.new('Sprites/ruby.png')
        @start_button = Gosu::Image.new('Sprites/StartButton2.png')
        @font = Gosu::Font.new(30)
        @Final_Screen = Gosu::Font.new(60)
        @time = 200
        @score = 0
        @x_coordinate = 0
        @y_coordinate = 0
        @velocity_x = 3
        @velocity_y = 2
        @ruby_visibility_counter = 0
        @ruby_visibility = true
        @end_game = false
        @start_screen = true
        

    end

    def update
        
        unless @end_game
            
            def button_down(id)
                if id == Gosu::MsLeft
                    if (mouse_x > @x_coordinate_screen/2-150 && mouse_x < @x_coordinate_screen/2-150 +299) && @start_screen
                        if (mouse_y > @y_coordinate_screen/2-85 && mouse_y < @y_coordinate_screen/2-85 + 172)
                            @start_screen = false 
                        end
                    
                    
                    elsif id == Gosu::MsLeft
                        if Gosu.distance(mouse_x,mouse_y,@x_coordinate,@y_coordinate) < 55 && @ruby_visibility
                            @score += 1
                        end
                    end
                end
            end
            @x_coordinate += @velocity_x
            @y_coordinate += @velocity_y
            if @x_coordinate < 0 || @x_coordinate > 800
                @velocity_x *= -1
                
            end
            
            if @y_coordinate < 0 || @y_coordinate > 600
                @velocity_y *= -1
            end
            
            @ruby_visibility_counter+=1
            
            if @ruby_visibility_counter >= 60 && rand < 0.018 
                @ruby_visibility = false
            end
            if @ruby_visibility_counter >= 120 && rand < 0.018 
                @ruby_visibility = true
                @ruby_visibility_counter = 0
            end
            @time -= 1
        end


    end

    def draw
        
        if @start_screen
             @start_button.draw(@x_coordinate_screen/2-150,@y_coordinate_screen/2-85,1)
        end
        
        
        
        unless @start_screen
            @hammer.draw(mouse_x-80,mouse_y-38,2)
            @font.draw("Score: #{@score}",0,0,0)
            @font.draw("Time left: #{@time/60}",620,0,0)
            
            
            if @ruby_visibility
                @ruby.draw(@x_coordinate-41,@y_coordinate-30,1)
            end    
            
            if @time <= 0
                @ruby_visibility = false
                @Final_Screen.draw("Game over",300,300,2)
                @end_game = true

            end


        end
    end

end

lady = Mole.new
lady.show