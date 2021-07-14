import React from 'react'
import { useForm } from "react-hook-form";
import { useState, useEffect } from "react";
import axios from 'axios';
import "../stylesheets/style.css";

export default function App() {
    const [page, setPage] = useState(1);
    const [data, setData] = useState({
        info: {
            firstname: '',
            lastname: '',
            email: '',
            message_attributes: {
                review: ''
            }
        },

    });
    const [subForm, setSubForm] = useState(false);

    useEffect(() => {
        if (subForm === true) {
            submit()
        }
    }, [subForm])

    function goNextPage() {
        if (page === 3) return;
        setPage((page) => page + 1);
    }

    function updateData(type, newData) {
        setData((data) => {
            return { ...data, [type]: newData };
        });
    }
    function formCompleted() {
        setSubForm(true)
    }

    function submit() {

        console.log(JSON.stringify(data))

        // axios.post('http://localhost:3000/feedbacks', data)
        //     .then(function (response) {
        //          console.log(response);
        //      })
        //      .catch(function (error) {
        //          console.log(error);
        //      });

    }



    return (
        <div className="App">
            <div>
                {page === 1 && <FormPartOne update={updateData} navigation={goNextPage} />}
                {page === 2 && <FormPartTwo update={updateData} navigation={goNextPage} />}
                {page === 3 && <FormFinalMessage update={formCompleted} />}
            </div>
        </div>
    );
}

function FormPartOne({ update, navigation }) {
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
            {/*<button onClick={() => update("info", newData)}>click</button>*/}
        </div>
    );
}

function FormPartTwo({ update, navigation }) {
    const { register, handleSubmit, formState: { errors } } = useForm();
    const onSubmit = (data) => {
        console.log(data)
        update("message_attributes", data)
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

function FormFinalMessage({ update }) {

    useEffect(() => {
       update()
    }, [])

    return (
        <div>
            <h1>Thanks</h1>
            <p>Thank you for your feedback !</p>
            <p> Our team will get back to you soon.</p>
            {/*<button type="submit" onClick={submitForm}>Submit</button>*/}
        </div>
    );
}

