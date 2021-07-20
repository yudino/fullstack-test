import React from 'react'
import { useForm } from "react-hook-form";

export default function FormPartOne({ update, navigation }) {
    const { register, handleSubmit, formState: { errors } } = useForm();
    const onSubmit = data => {
        update("info", data)
        navigation()
    };
    return (
        <div>
            <form onSubmit={handleSubmit(onSubmit)}>
                <h1>Infos</h1>
                <label htmlFor="firstname">firstname</label>
                <input placeholder="Firstname" id="firstname" autoFocus {...register("firstname", { required: true })} />
                {errors.firstname && <span>This field is required</span>}

                <label htmlFor="lastname">Lastname</label>
                <input placeholder="Lastname" id="lastname" {...register("lastname", { required: true })} />
                {errors.lastname && <span>This field is required</span>}

                <label htmlFor="email">Email</label>
                <input placeholder="Email" type="email" id="email"  {...register("email", { required: true })} />
                {errors.email && <span>This field is required</span>}

                <button type="submit">Next</button>
            </form>
        </div>
    );
}