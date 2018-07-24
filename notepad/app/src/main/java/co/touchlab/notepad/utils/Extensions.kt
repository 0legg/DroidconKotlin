package co.touchlab.notepad.utils

import android.view.View

fun View.setViewVisibility(value: Boolean) {
    this.visibility = if (value) View.VISIBLE else View.INVISIBLE
}