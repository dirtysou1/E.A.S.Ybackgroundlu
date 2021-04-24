package com.example.easy

import android.app.Application


class App : Application() {
    class App : Application() {
        override fun onCreate() {
            super.onCreate()
            registerActivityLifecycleCallbacks(LifecycleDetector.activityLifecycleCallbacks)
        }
    }
}