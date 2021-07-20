import React from 'react'
import { useEffect } from "react";


export default function FormFinalMessage({ update }) {

    useEffect(() => {
        update()
    }, [])

    return (
        <div>
            <h1>Thanks</h1>
            <p>Thank you for your feedback !</p>
            <p> Our team will get back to you soon.</p>
        </div>
    );
}