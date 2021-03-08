package com.main;

import javafx.event.ActionEvent;
import javafx.event.EventHandler;
import javafx.scene.Node;
import javafx.util.Duration;

public class FadeTransition {

    public static void applyFadeTransition(Node node, Duration duration, EventHandler<ActionEvent> event) {
        javafx.animation.FadeTransition fadeIn = new javafx.animation.FadeTransition(duration, node);
        fadeIn.setCycleCount(2);
        fadeIn.setFromValue(1);
        fadeIn.setToValue(2);
        fadeIn.setAutoReverse(true);
        fadeIn.setOnFinished(event);

        javafx.animation.FadeTransition fadeOut = new javafx.animation.FadeTransition(duration, node);
        fadeOut.setCycleCount(2);
        fadeOut.setFromValue(2);
        fadeOut.setToValue(1);
        fadeOut.setAutoReverse(true);

        fadeOut.play();
        fadeOut.setOnFinished((e) -> {
            fadeIn.play();
        });
    }

}
