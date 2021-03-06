/**
* Project : bangplayer 
* Author : Erwan
* Version : 1.0.0
* Date : 10-10-2014
* Description here
*/

import codeanticode.syphon.*;

import de.looksgood.ani.*;
import de.looksgood.ani.easing.*;

SFD send;

static int BPM = 112;
static float BPMTOMS = round(1000.0/(BPM/60.0));
static float BPMTOS = BPMTOMS / 1000;

Player player;
JSONReader data;

Dots dots;

int _time = 0;

color white = color(255);
color green = color(46, 204, 64);
color orange = color(255, 133, 27);
color redblood = color(136, 20, 13);
color yellow = color(255, 220, 0);
color black = color(0);

void setup() {
    size(displayWidth, displayHeight, P3D);

    Ani.init(this);

    this.data = new JSONReader("data/data.json");
    this.dots = new Dots();
    ellipseMode(CENTER);
    this.player = new Player("data/dexter.mp3", this);
    this.player.start();

    send = new SFD(this);
}

void draw() {
    background(0);
    noStroke();
    this._time = this.player.timeElapsed();
    if (this.data.doIPlay(_time, "bang"))
        this.dots.bang();
    if (this.data.doIPlay(_time, "bam"))
        this.dots.bam();
    if (this.data.doIPlay(_time, "dong"))
        this.dots.dong();
    if (this.data.doIPlay(_time, "ding"))
        this.dots.ding();
    this.dots.draw();
    // fill(white);
    // text(frameRate, 50, 50);
    send.update();
}

boolean sketchFullScreen(){
    // return true;
    return false;
}