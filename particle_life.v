//TODO: Mutation 

module main

import gg
import gx
import strings

//import math as m
import rand as rd

const (
    win_width    = 601
    win_height   = 601
    bg_color     = gx.black
    detec_radius = 30
    nb_creatures = 100
)

struct Creature{
    x f32
    y f32
    color u8
}

struct App {
mut:
    gg    &gg.Context = unsafe { nil }
    mouse struct {
    mut:
        x f32
        y f32
    }
    crea_list []Creature
}




fn main() {
    mut app := &App{
        gg: 0
    }
    app.gg = gg.new_context(
        width: win_width
        height: win_height
        create_window: true
        window_title: '- IDE -'
        user_data: app
        bg_color: bg_color
        frame_fn: on_frame
		event_fn: on_event
    )

    //lancement du programme/de la fenêtreStarting
    println(" the simulation o/")

    for i in 0..100{
        app.crea_list << Creature{rd.f32_in_range(0, win_width)!, rd.f32_in_range(0, win_height)! , 100}
    }


    app.gg.run()
    
	println("Byeee ^^")
}

fn on_frame(mut app App) {
    app.gg.begin()
    x_distance := 0.0
    y_distance := 0.0
    dist := 0.0
    for crea in app.crea_list{
        app.gg.draw_circle_filled(crea.x, crea.y , 2.5, gx.red)
        for sec_crea in app.crea_list{
            x_distance = crea.x - sec_crea.x
            y_distance = crea.y - sec_crea.y
            dist = x_distance * x_distance + y_distance * y_distance
            if dist < detec_radius{
                // a faire
            }
        }
    }
    app.gg.end()
}


fn on_event(e &gg.Event, mut app App){
    match e.typ {
        .key_down {
            match e.key_code {
                .escape {
                    app.gg.quit()
                }
                .right {
                }
                .left {
                }
                .down {
                }
                .up {
                }
                else {}
            }
        }
        .mouse_move {
        }
        else {}
    }
}
