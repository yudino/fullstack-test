import React from 'react'
import { useState, useEffect } from "react";
import axios from 'axios';

import FormPartOne from './FormParts/FormPartOne';
import FormPartTwo from './FormParts/FormPartTwo';
import FormFinalMessage from './FormParts/FormFinalMessage';

import "../stylesheets/style.css";

export default function App() {
    const [page, setPage] = useState(1);
    const [data, setData] = useState({
        info: {
            firstname: "",
            lastname: "",
            email: ""
        },
        message: {
            review: ""
        }
    });
    const [subForm, setSubForm] = useState(false);

    useEffect(() => {
        if (subForm === true) {
            submit(data)
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

    function submit({ info, message }) {
        const formData = `
            {
                "info": {
                    "firstname": "${info.firstname}",
                    "lastname": "${info.lastname}",
                    "email": "${info.email}",
                    "message_attributes": {
                        "review": "${message.review}"
                    }
                }
            }
        `
        console.log(JSON.parse(formData))

        
        axios.post('http://localhost:3000/feedbacks', JSON.parse(formData))
            .then(function (response) {
                 console.log(response);
             })
             .catch(function (error) {
                 console.log(error);
             });
        
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






