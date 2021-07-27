import React from 'react'
import { useForm } from "react-hook-form";

export default function FormPartTwo({ update, navigation }) {
    const { register, handleSubmit, formState: { errors } } = useForm();
    const onSubmit = (data) => {
        update("message", data)
        navigation()
    };

    return (
        <div>
            <form onSubmit={handleSubmit(onSubmit)}>
                <h1>Messages</h1>
                <label htmlFor="review">review</label>
                <textarea id="review" rows="10" cols="100" autoFocus {...register("review", { required: true })}></textarea>
                {errors.review && <span>This field is required</span>}

                <button type="submit" className="redBg">Submit</button>
            </form>
        </div>
    );
}